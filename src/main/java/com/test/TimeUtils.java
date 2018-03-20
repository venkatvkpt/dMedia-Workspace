package com.test;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import static java.util.concurrent.TimeUnit.MILLISECONDS;

public class TimeUtils {

    /**
     * Converts time to a human readable format within the specified range
     *
     * @param duration the time in milliseconds to be converted
     * @param max      the highest time unit of interest
     * @param min      the lowest time unit of interest
     */
    public static String formatMillis(long duration, TimeUnit max, TimeUnit min) {
        StringBuilder res = new StringBuilder();

        TimeUnit current = max;

        while (duration > 0) {
            long temp = current.convert(duration, MILLISECONDS);

            if (temp > 0) {
                duration -= current.toMillis(temp);
                res.append(temp).append(" ").append(current.name().toLowerCase());
                if (temp < 2) res.deleteCharAt(res.length() - 1);
                res.append(", ");
            }

            if (current == min) break;

            current = TimeUnit.values()[current.ordinal() - 1];
        }

        // clean up our formatting....

        // we never got a hit, the time is lower than we care about
        if (res.lastIndexOf(", ") < 0) return "0 " + min.name().toLowerCase();

        // yank trailing  ", "
        res.deleteCharAt(res.length() - 2);

        //  convert last ", " to " and"
        int i = res.lastIndexOf(", ");
        if (i > 0) {
            res.deleteCharAt(i);
            res.insert(i, " and");
        }

        return res.toString();
    }
    
    public static void main(String args[]){
    	
    	String dateStart = "11/03/14 09:29:58";
        String dateStop = "11/03/14 09:33:43";

       
        SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm:ss");

        Date d1 = null;
        Date d2 = null;
        try {
            d1 = format.parse(dateStart);
            d2 = format.parse(dateStop);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Get msec from each, and subtract.
        long diff = d2.getTime() - d1.getTime();
        long diffSeconds = diff / 1000 % 60;
        long diffMinutes = diff / (60 * 1000) % 60;
        long diffHours = diff / (60 * 60 * 1000);
        System.out.println("Time in seconds: " + diffSeconds + " seconds.");
        System.out.println("Time in minutes: " + diffMinutes + " minutes.");
        System.out.println("Time in hours: " + diffHours + " hours.");
    }
}