package com.academicore.campus.application.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UploadUrlResponse {

    private String urlSubida;
    private String urlPublicaResultante;
    private int expiraEn;
}
