package com.newone.mall.common.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;

/**
 * @author newone
 * @date 2023/11/14
 * @description Json 工具类
 */
@Slf4j
public class JsonUtil {
    private static final ObjectMapper INSTANCE = new ObjectMapper();

    public static String toJsonString(Object obj){
        try{
            return INSTANCE.writeValueAsString(obj);
        } catch (JsonProcessingException e){
            return obj.toString();
        }
    }
}
