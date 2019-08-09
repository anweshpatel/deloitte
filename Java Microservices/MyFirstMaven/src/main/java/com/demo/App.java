package com.demo;

/**
 * Hello world!
 *
 */
public class App {
    public static void main( String[] args ) throws ClassNotFoundException {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
        System.out.println( "Oracle Driver Loaded" );

    }
}
