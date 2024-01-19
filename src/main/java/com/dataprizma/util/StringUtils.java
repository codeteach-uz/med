package com.dataprizma.util;

/**
 * Created by Admin on 01/03/2015.
 */
public class StringUtils {
    public static boolean isBlank(String s) {
        return s==null || s.length()==0;
    }

    public static boolean isEmpty(String s){
        return s==null || s.trim().equals("");
    }
}
