/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LibFaculty;

import java.util.Random;

/**
 *
 * @author PushkarSharma
 */
public class GenerateRandomPassword {
    public static String RandomPassword(){
        int length=10;
        String CapitalChars="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String SmallChars="abcdefghijklmnopqrstuvwxyz";
        String numbers="1234567890";
        String symbols="!@#$%";
        String values=CapitalChars+SmallChars+numbers;
        Random r=new Random();
        char password[]=new char[length];
        for (int i=0;i<length;i++){
            password[i]=values.charAt(r.nextInt(values.length()));
        }
        String result="";
        for (int i=0;i<length;i++){
            result=result+password[i];
        }
        return result;
    }
}
