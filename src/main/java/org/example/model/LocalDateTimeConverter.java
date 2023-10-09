package org.example.model;
import org.springframework.core.convert.converter.Converter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


public final class LocalDateTimeConverter implements Converter<String, LocalDateTime> {

    private DateTimeFormatter formatter;

    public LocalDateTimeConverter(String dateFormat){
        this.formatter=DateTimeFormatter.ofPattern(dateFormat);
    }
//    // Receive the date value from the HTTP request (e.g., using Spring MVC).The value coming from browser taking as source
//    String dateValueFromBrowser = request.getParameter("dateField");
//
//    // Create an instance of your converter.
//    LocalDateTimeConverter converter = new LocalDateTimeConverter("yyyy-MM-dd'T'HH:mm");
//
//    // Use the converter to convert the date value.
//    LocalDateTime dateTime = converter.convert(dateValueFromBrowser);

// Now, 'dateTime' contains the parsed date and time value.

//

    @Override
    public LocalDateTime convert(String source) {
        if(source==null ||source.isEmpty()) {

            return null;
        }
        else{
            return LocalDateTime.parse(source ,formatter);
        }
    }
}
