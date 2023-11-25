package com.newone.mall.web.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FindUserInfoRspVO {
    /**
     * 用户名
     */
    private String username;

}