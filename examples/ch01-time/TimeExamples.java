import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.YearMonth;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.TimeZone;

public final class TimeExamples {
    private static int checks;

    public static void main(String[] args) {
        testAccessWindow();
        testMonthlyAnchor();
        testAppointments();
        testBusinessDays();
        testRepresentations();
        testDefaultZoneIndependence();
        testStrictDates();
        System.out.println("Checks passed: " + checks);
    }

    static boolean isWithinValidityWindow(Clock clock, Instant startsAt, Instant expiresAt) {
        Instant now = clock.instant();
        return !now.isBefore(startsAt) && now.isBefore(expiresAt);
    }

    static LocalDate boundaryFromAnchor(LocalDate anchor, long periodIndex) {
        YearMonth target = YearMonth.from(anchor).plusMonths(periodIndex);
        int day = Math.min(anchor.getDayOfMonth(), target.lengthOfMonth());
        return target.atDay(day);
    }

    static Instant resolveAppointment(
            LocalDateTime local, ZoneId zone, ZoneOffset selectedOffset) {
        List<ZoneOffset> valid = zone.getRules().getValidOffsets(local);
        if (valid.isEmpty()) {
            throw new IllegalArgumentException("Local time does not exist");
        }
        if (valid.size() > 1 && selectedOffset == null) {
            throw new IllegalArgumentException("Select an offset for the overlap");
        }
        ZoneOffset chosen = selectedOffset == null ? valid.get(0) : selectedOffset;
        if (!valid.contains(chosen)) {
            throw new IllegalArgumentException("Offset does not match zone rules");
        }
        return ZonedDateTime.ofStrict(local, chosen, zone).toInstant();
    }

    private static void testAccessWindow() {
        Instant start = Instant.parse("2027-02-28T16:00:00Z");
        Instant end = Instant.parse("2027-03-31T16:00:00Z");
        check(!accessAt(start.minusNanos(1), start, end), "before start");
        check(accessAt(start, start, end), "inclusive start");
        check(accessAt(end.minusNanos(1), start, end), "before exclusive end");
        check(!accessAt(end, start, end), "exclusive end");
        check(!accessAt(end.plusNanos(1), start, end), "after end");
        check(accessAt(end.minusMillis(1), start, end), "table: one millisecond before end");
        check(!accessAt(end.plusMillis(1), start, end), "table: one millisecond after end");
        check(!accessAt(start.minusMillis(1), start, end), "table: one millisecond before start");
        check(!accessAt(start, start, start), "empty interval has no valid instant");
    }

    private static boolean accessAt(Instant now, Instant start, Instant end) {
        return isWithinValidityWindow(Clock.fixed(now, ZoneOffset.UTC), start, end);
    }

    private static void testMonthlyAnchor() {
        LocalDate anchor = LocalDate.of(2027, 1, 31);
        check(boundaryFromAnchor(anchor, 1).equals(LocalDate.of(2027, 2, 28)),
                "short month clamps");
        check(boundaryFromAnchor(anchor, 2).equals(LocalDate.of(2027, 3, 31)),
                "original anchor is restored");
        check(anchor.plusMonths(1).plusMonths(1).equals(LocalDate.of(2027, 3, 28)),
                "chained addition drifts");
        check(boundaryFromAnchor(LocalDate.of(2028, 1, 31), 1)
                .equals(LocalDate.of(2028, 2, 29)), "leap-year month");

        for (int year = 2020; year <= 2030; year++) {
            for (int month = 1; month <= 12; month++) {
                YearMonth origin = YearMonth.of(year, month);
                for (int day = 28; day <= origin.lengthOfMonth(); day++) {
                    LocalDate original = origin.atDay(day);
                    LocalDate previous = original;
                    for (int index = 1; index <= 36; index++) {
                        LocalDate actual = boundaryFromAnchor(original, index);
                        YearMonth target = origin.plusMonths(index);
                        check(YearMonth.from(actual).equals(target), "target month");
                        check(actual.getDayOfMonth()
                                == Math.min(day, target.lengthOfMonth()), "anchor rule");
                        check(actual.isAfter(previous), "increasing monthly boundaries");
                        previous = actual;
                    }
                }
            }
        }
    }

    private static void testAppointments() {
        ZoneId ny = ZoneId.of("America/New_York");
        LocalDateTime gap = LocalDateTime.of(2025, 3, 9, 2, 30);
        expectIllegal(() -> resolveAppointment(gap, ny, null), "gap is rejected");
        LocalDateTime overlap = LocalDateTime.of(2025, 11, 2, 1, 30);
        expectIllegal(() -> resolveAppointment(overlap, ny, null),
                "overlap requires selection");
        Instant first = resolveAppointment(overlap, ny, ZoneOffset.ofHours(-4));
        Instant second = resolveAppointment(overlap, ny, ZoneOffset.ofHours(-5));
        check(first.equals(Instant.parse("2025-11-02T05:30:00Z")), "first overlap");
        check(second.equals(Instant.parse("2025-11-02T06:30:00Z")), "second overlap");
        check(Duration.between(first, second).equals(Duration.ofHours(1)),
                "overlap candidates differ by an hour");
        expectIllegal(() -> resolveAppointment(overlap, ny, ZoneOffset.UTC),
                "invalid selected offset");
        LocalDateTime summer = LocalDateTime.of(2027, 7, 10, 9, 0);
        check(resolveAppointment(summer, ny, null)
                .equals(Instant.parse("2027-07-10T13:00:00Z")), "course instant");
        expectIllegal(() -> resolveAppointment(summer, ny, ZoneOffset.ofHours(-5)),
                "winter offset is invalid for this summer appointment");
    }

    private static void testBusinessDays() {
        ZoneId ny = ZoneId.of("America/New_York");
        check(dayLength(LocalDate.of(2025, 3, 9), ny).equals(Duration.ofHours(23)),
                "spring day has 23 hours");
        check(dayLength(LocalDate.of(2025, 11, 2), ny).equals(Duration.ofHours(25)),
                "autumn day has 25 hours");
        ZonedDateTime noon = ZonedDateTime.of(2025, 3, 8, 12, 0, 0, 0, ny);
        check(noon.plus(Period.ofDays(1)).getHour() == 12, "calendar day keeps noon");
        check(noon.plus(Duration.ofHours(24)).getHour() == 13,
                "24-hour duration reaches 13:00");

        ZoneId shanghai = ZoneId.of("Asia/Shanghai");
        LocalDate date = LocalDate.of(2027, 3, 31);
        Instant begin = date.atStartOfDay(shanghai).toInstant();
        Instant end = date.plusDays(1).atStartOfDay(shanghai).toInstant();
        check(begin.equals(Instant.parse("2027-03-30T16:00:00Z")), "report begin");
        check(end.equals(Instant.parse("2027-03-31T16:00:00Z")), "report end");
        Instant nextStart = date.plusDays(1).atStartOfDay(shanghai).toInstant();
        Instant nextEnd = date.plusDays(2).atStartOfDay(shanghai).toInstant();
        check(!inRange(end, begin, end), "boundary excluded from old day");
        check(inRange(end, nextStart, nextEnd), "boundary included in next day");

        for (ZoneId zone : new ZoneId[] {ny, shanghai}) {
            LocalDate firstDay = LocalDate.of(2025, 1, 1);
            Instant previousEnd = null;
            for (int index = 0; index < 365; index++) {
                LocalDate current = firstDay.plusDays(index);
                Instant a = current.atStartOfDay(zone).toInstant();
                Instant b = current.plusDays(1).atStartOfDay(zone).toInstant();
                if (previousEnd != null) {
                    check(a.equals(previousEnd), "adjacent intervals have no gap");
                }
                check(inRange(a, a, b), "day includes its beginning");
                check(inRange(b.minusNanos(1), a, b), "day includes its last adjacent instant");
                check(!inRange(b, a, b), "day excludes next boundary");
                previousEnd = b;
            }
        }
    }

    private static Duration dayLength(LocalDate date, ZoneId zone) {
        return Duration.between(date.atStartOfDay(zone).toInstant(),
                date.plusDays(1).atStartOfDay(zone).toInstant());
    }

    private static boolean inRange(Instant event, Instant begin, Instant end) {
        return !event.isBefore(begin) && event.isBefore(end);
    }

    private static void testRepresentations() {
        check(Instant.parse("2027-04-01T00:00:00+08:00")
                .equals(Instant.parse("2027-03-31T16:00:00Z")), "offset equivalence");
        check(Instant.ofEpochSecond(1700000000L)
                .equals(Instant.ofEpochMilli(1700000000000L)), "epoch unit equivalence");
        check(Instant.ofEpochSecond(1700000000L)
                .equals(Instant.parse("2023-11-14T22:13:20Z")), "epoch display");
        String a = "2027-04-01T00:30:00+08:00";
        String b = "2027-03-31T23:30:00Z";
        check(a.compareTo(b) > 0 && Instant.parse(a).isBefore(Instant.parse(b)),
                "text order can disagree with instant order");
        check(Instant.parse("2038-01-19T03:14:07Z").getEpochSecond()
                == Integer.MAX_VALUE, "signed 32-bit epoch boundary");
    }

    private static void testDefaultZoneIndependence() {
        TimeZone original = TimeZone.getDefault();
        try {
            Instant expected = Instant.parse("2027-03-30T16:00:00Z");
            for (String defaultZone : new String[] {"UTC", "Asia/Shanghai", "America/New_York"}) {
                TimeZone.setDefault(TimeZone.getTimeZone(defaultZone));
                check(LocalDate.of(2027, 3, 31).atStartOfDay(ZoneId.of("Asia/Shanghai"))
                        .toInstant().equals(expected), "explicit zone is independent");
            }
        } finally {
            TimeZone.setDefault(original);
        }
    }

    private static void testStrictDates() {
        try {
            LocalDate.parse("2027-02-29");
            throw new AssertionError("Invalid date was accepted");
        } catch (DateTimeParseException expected) {
            checks++;
        }
        check(LocalDate.parse("2028-02-29").equals(LocalDate.of(2028, 2, 29)),
                "valid leap date");
    }

    private static void expectIllegal(Runnable operation, String label) {
        try {
            operation.run();
            throw new AssertionError(label);
        } catch (IllegalArgumentException expected) {
            checks++;
        }
    }

    private static void check(boolean condition, String label) {
        if (!condition) {
            throw new AssertionError(label);
        }
        checks++;
    }
}
