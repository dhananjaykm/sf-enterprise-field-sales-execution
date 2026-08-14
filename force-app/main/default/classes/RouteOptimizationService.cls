/**
 * MIGRATION: E/G — geospatial optimizer. Keep Apex (or native industry routing).
 */
public with sharing class RouteOptimizationService {
    public static List<Integer> optimize(List<Decimal> latitudes, List<Decimal> longitudes) {
        List<Integer> order = new List<Integer>();
        Set<Integer> used = new Set<Integer>();
        Integer current = 0;
        while (order.size() < latitudes.size()) {
            Integer best = -1;
            Decimal bestD = 999999;
            for (Integer i = 0; i < latitudes.size(); i++) {
                if (used.contains(i)) continue;
                Decimal d = (latitudes[i] - latitudes[current]).pow(2) + (longitudes[i] - longitudes[current]).pow(2);
                if (d < bestD) { bestD = d; best = i; }
            }
            if (best < 0) break;
            used.add(best);
            order.add(best);
            current = best;
        }
        return order;
    }
}
