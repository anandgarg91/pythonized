import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
 
class Main
{
    public static void main(String[] args)
    {
        File file = new File("s_w.txt");
 
        try (BufferedReader in = new BufferedReader(new FileReader(file)))
        {
            
              //  System.out.println(line);
            //}
    //PrintStream p=new PrintStream(new FileReader(file));        
int i=0,rec_ptr=-1,nf,rec_win_size=8;
String rec_buf[]=new String[8];
String ch; System.out.println();
do
{
nf=Integer.parseInt(in.readLine());
System.out.println(nf);
if(nf<=rec_win_size-1)
{
for(i=1;i<=nf;i++)
{
rec_ptr=++rec_ptr%8;
rec_buf[rec_ptr]=in.readLine();
System.out.println("The received Frame " +rec_ptr+" is : "+rec_buf[rec_ptr]);
}
rec_win_size-=nf;
System.out.println("\nAcknowledgment sent\n");
//p.println(rec_ptr+1); 
rec_win_size+=nf; }
else
break;
ch=in.readLine();
}
while(ch.equals("yes"));
}
            
            
         catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    }
