#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

//Extern Variables
extern double lot = 0.01;

//Global Variables

int buyCount = 0;
int sellCount = 0;
int BC = 0;
int SC = 0;
int count = 0;
int toplam = 0;
int pass = 1;
int fileHandle;
int total;
double BCP,SCP,BCdouble,SCdouble;
double mainPrice,highPrice,lowPrice;

int let = 1;
int let2 = 0;

int firstBCFark = 0;
int lastBCFark = 0;
int firstSCFark = 0;
int lastSCFark = 0;


int OnInit()
  {   
      mainPrice = Ask;
      highPrice = Ask+0.001;
      lowPrice  = Ask-0.001;
      
      string filePath = "values.csv"; // CSV dosya adı
      fileHandle = FileOpen(filePath, FILE_CSV|FILE_WRITE, ','); // CSV formatında dosyayı aç
      
   return(INIT_SUCCEEDED);
  }

void OnTick()
  {
  
//___________________________________________Kaç adet buy ve sell işlemi olduğu toplanır_______________________________________________________
      
      buyCount = 0;
      sellCount = 0;
      for(int i=0; i<OrdersTotal(); i++){
         
         OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
         
         if(OrderType() == 0)
         buyCount++;
         
         if(OrderType()==1)
         sellCount++;
      }
  
 //__________________________________________Saat ve dakika bilgileri toplanır__________________________________________________________________
  
       datetime currentTime = TimeCurrent();
       int hour = TimeHour(currentTime);
       int minute = TimeMinute(currentTime);
       
//___________________________________________Saat 15.30 ise yapılacaklar________________________________________________________________________
       
       if(hour == 15 && minute == 30 && pass == 1){
         
         printf("BUY TP COUNT %d",BC);
         printf("SELL TP COUNT %d",SC);

         
         if(SC > BC){
         
            total = OrdersTotal();
            if(total >= 1){
            
                  for(int i=0; i<total; i++){
                  
                  OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
                  
                  if(OrderType()==1){
                     
                     OrderClose(OrderTicket(),OrderLots(),Ask,0,clrNONE);
                     i=-1;
                     total = OrdersTotal();
                     if(total==0)
                     break;
                  }
               }
            }
         
            //Buy emri açılır
            if(buyCount == 0){
               OrderSend(NULL,OP_BUY,lot,Ask,0,0,0,NULL,0,0,clrNONE);
            }
            
         }
         
         
         if(BC > SC){
         
         
            total = OrdersTotal();
            if(total >= 1){
                  
                  for(int i=0; i<total; i++){
               
                  OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
                  
                  if(OrderType()==0){
                     
                     OrderClose(OrderTicket(),OrderLots(),Bid,0,clrNONE);
                     i=-1;
                     total = OrdersTotal();
                     if(total==0)
                     break;
                  }
               }
            }
         
            //Sell emiri açılır
            if(sellCount == 0){
               OrderSend(NULL,OP_SELL,lot,Bid,0,0,0,NULL,0,0,clrNONE);
            }
            
         }
         
         
         //CSV DOSYAYA YAZMA KISMI
         BCdouble = (double)BC;
         SCdouble = (double)SC;
         
         BCP = 100*BCdouble / (BCdouble+SCdouble);
         SCP = 100*SCdouble / (BCdouble+SCdouble);
         
         
         WriteDataToCSV(BCP,SCP);
         
         
         pass = 0;
         
       }
       
//___________________________________________Saat 15.35 olduğunda yapılacaklar_________________________________________________________________
       
       if(hour == 16 && minute == 05){
         pass = 1;
       }
       
//___________________________________________Fiyat Belirlemek için Koşullar ___________________________________________________________________

      if(Ask >= highPrice){
         
         BC++;
         
         mainPrice = Ask;
         highPrice = Ask+0.001;
         lowPrice  = Ask-0.001;
      }
      else if(Ask <= lowPrice){
         
         SC++;
         
         mainPrice = Ask;
         highPrice = Ask+0.001;
         lowPrice  = Ask-0.001;
      }

  }//OnTick
  
  
  
  
  
  
  
  
  
  
  
  
// CSV dosyasına veri yazma işlemi
void WriteDataToCSV(double data1, double data2)
{
    

    if (fileHandle != INVALID_HANDLE) // Dosya başarıyla açıldıysa
    {
   
        string dataStr1 = DoubleToString(data1); // Double türündeki veriyi stringe dönüştür
        string dataStr2 = DoubleToString(data2); // Double türündeki veriyi stringe dönüştür
        
        FileWrite(fileHandle, dataStr1, dataStr2); // Tarih ve veriyi CSV dosyasına yaz
        //FileClose(fileHandle); // Dosyayı kapat
    }
    else
    {
        Print("Dosya açılamadı! Hata kodu: ", GetLastError());
    }
}  


