package ngz.markov.quality.model ; 

import java.util.List;

import lombok.Value;
import lombok.Builder;

@Value
@Builder
public class InvalidRecord<T> {

    private String sourceStep ; 
    long timestamp ; 
    private List<String> errors ;
    private T payload  ;

}
