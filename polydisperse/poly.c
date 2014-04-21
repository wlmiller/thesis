#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define N 100
#define STEPS 10000000
#define EPS 0.000001
#define L 160


typedef struct{
 int x,y,z;
} vec;
 
void init(void);
void MC(int);
void writex(void);

vec pos[N+1],disp[27+1];
int used[L+1][L+1][L+1]; 
double E0=-5.0;

main(){
 int i,j,k;
  FILE *in;
  in=fopen("aaa.xyz","w");fclose(in); 

 
 
 init();	
 
 for (i=1;i<=STEPS;i++){
   for (j=1;j<=N;j++){
     k=1+(int)( (double)(N)*drand48() );
     MC(k);
   }
   
   if (i%10000==0) {printf("%d\n",i);writex();}
   
 }
 	
	
 
}
///////////////////////
void init(void){
 int i,j;
 int k,a,b,c,s;
 int e1,e2,e3;
 
 for (i=1;i<=L;i++){
  for (j=1;j<=L;j++){
   for (k=1;k<=L;k++){
    used[i][j][k]=0;
   }
  } 
 }
 
 
 pos[1].x=1;pos[1].y=1;pos[1].z=1;
 i=1;
 used[ pos[i].x ][ pos[i].y ][ pos[i].z ]=1;
 
  for (i=2;i<=N;i++){

    k=1+(int)(3.0*drand48());
    if (k==1) e1=1; else e1=0; 
    if (k==2) e2=1; else e2=0; 
    if (k==3) e3=1; else e3=0; 
     
    pos[i].x=pos[i-1].x+e1;
    pos[i].y=pos[i-1].y+e2;
    pos[i].z=pos[i-1].z+e3;
    used[ pos[i].x ][ pos[i].y ][ pos[i].z ]=1;
  }

 s=0;
 for (i=0;i<=2;i++){
  for (j=0;j<=2;j++){
   for (k=0;k<=2;k++){
    s++;
    a=-1+i;
    b=-1+j;
    c=-1+k;
    disp[s].x=a;
    disp[s].y=b;
    disp[s].z=c;
  
   }
  } 
 }





}
///////////////////////
void MC(int k){
 int i;
 int s;
 double dx,dy,dz,dr;
 double Eold,Enew;
 vec old;
 
 s=1+(int)(27.0*drand48());
 old.x=pos[k].x;
 old.y=pos[k].y;
 old.z=pos[k].z;
 
 
 
 
 pos[k].x+=disp[s].x;
 pos[k].y+=disp[s].y;
 pos[k].z+=disp[s].z;
 
 
  if (pos[k].x>L || pos[k].y>L || pos[k].z>L ||
     pos[k].x<1 || pos[k].y<1 || pos[k].z<1){
     
     pos[k].x=old.x;
     pos[k].y=old.y;
     pos[k].z=old.z;
     return;	 
 }
 
 
 
  if (used[ pos[k].x ][ pos[k].y ][ pos[k].z ]==1){      
     pos[k].x=old.x;
     pos[k].y=old.y;
     pos[k].z=old.z;
     return;	 
  } 
 
 
 
 

 if (k>1){
  dx=(double)(pos[k].x-pos[k-1].x); 
  dy=(double)(pos[k].y-pos[k-1].y);
  dz=(double)(pos[k].z-pos[k-1].z); 
  dr=sqrt(dx*dx + dy*dy + dz*dz);
  //printf("dr=%lf\n",dr);
  if (fabs(dr-1)>EPS  ){ 
   pos[k].x=old.x;
   pos[k].y=old.y;
   pos[k].z=old.z;
   
   return;	 
  }
 }
  
 if (k<N){
  dx=(double)(pos[k].x-pos[k+1].x); 
  dy=(double)(pos[k].y-pos[k+1].y);
  dz=(double)(pos[k].z-pos[k+1].z);
  dr=sqrt(dx*dx + dy*dy + dz*dz);
  if (fabs(dr-1)>EPS  ){ 
   pos[k].x=old.x;
   pos[k].y=old.y;
   pos[k].z=old.z;

   return;	 
  }
 }
 
 // accept
 
 used[ pos[k].x ][ pos[k].y ][ pos[k].z ]=1;
 used[ old.x ][ old.y ][ old.z ]=0;
 
 
 
 
 
} 
 
 ///////////////////////
void writex(void){
 int i;
 FILE *in;
 in=fopen("aaa.xyz","a"); 
  
  fprintf(in,"%d\n\n",N);
  for (i=1;i<=N;i++){
    fprintf(in,"H %d %d %d\n", 
    pos[i].x,
    pos[i].y,
    pos[i].z);
  
  }
  fclose(in);
}
 
 
  
 
 



