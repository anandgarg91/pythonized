    import java.io.FileOutputStream;  
    import java.util.Scanner;  
    public class filesender  
    {  
    public static void main(String args[])  
    {  
    try  
    {  
    Scanner sc=new Scanner(System.in);          
    System.out.print("Enter the file name: ");  
    String name=sc.nextLine();               
    FileOutputStream fos=new FileOutputStream(name, true); 
    System.out.print("Enter file content: ");         
    String str;
    //int win_size=6;
    //int i =0;
    do{
    str=sc.nextLine()+"\n";      
    //i++;
    byte[] b= str.getBytes();        
    fos.write(b);
    }while(str != "stop");           
    fos.close();            
    System.out.println("file saved.");  
    }  
    catch(Exception e)  
    {  
    e.printStackTrace();          
    }  
    }  
    }  
