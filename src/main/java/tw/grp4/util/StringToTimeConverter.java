package tw.grp4.util;

import org.springframework.core.convert.converter.Converter;

import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class StringToTimeConverter implements Converter<String, Time> {

    @Override
    public Time convert(String time) {
        DateFormat sdf = new SimpleDateFormat("hh:mm");
        try {
            return new Time(sdf.parse(time).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("String Convert to Time - Error");
            return null;
        }
    }
}