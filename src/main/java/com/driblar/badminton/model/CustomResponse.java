package com.driblar.badminton.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CustomResponse {
    private String text;

    public CustomResponse (String text) {
        this.text = text;
    }

}
