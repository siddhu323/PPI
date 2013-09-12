/* Input - ASA file of both chains then the individual chains
   - rex option for generating hb files, which contains regexes to search for exact atoms in the pdb files */
   


#include<stdio.h>
#include<string.h>

struct file_pointers{
  FILE *f1,*f2,*f3,*f4,*f5,*f6;
};

void interface(file_pointers & fptr,int &buried ,int &total,char * hb=NULL)
{
  char atom[5],residue[5],chain;
  int num1,num2,resnum;
  float x,y,z,asa1,asa2,vdwr;
  char s1[75],s2[75];
  FILE *ft;

  ft = fptr.f2;
  
   while(fgets(s1,75,fptr.f1) && ( fgets(s2,75,ft) || fgets(s2,75,fptr.f3) ))
     // while(fgets(s1,75,fptr.f1) )
    {
      sscanf(s1,"%*s %d %s %s %c %d %f %f %f %f %f\n",&num1,atom,residue,&chain,&resnum,&x,&y,&z,&asa1,&vdwr);
      sscanf(s2,"%*s %d %*s %*s %*c %*d %*f %*f %*f %f %*f\n",&num2,&asa2);
      float k = asa2-asa1;
      if(num1 == num2 )
	{
	  if(k > 0.1)
	    {
	      total++;
	      fprintf(fptr.f4,"ATOM%7d%5s%4s%2c%4d%12.3f%8.3f%8.3f%8.3f%8.3f%8.3f\n",num1,atom,residue,chain,resnum,x,y,z,asa1,asa2,k);
	      if(hb && strcmp(hb,"-rex") == 0)
		{
		  fprintf(fptr.f5,"^%c%04d.....%s \n",chain,resnum,atom);
		  fprintf(fptr.f6,"^..............%c%04d.....%s \n",chain,resnum,atom);
		}
	      if(asa1 < 0.01)
		buried++;
	    }

	}
    }
}

int main(int argc,char *argv[])
{
  file_pointers fptr;
  fptr.f1=fopen(argv[1],"r");
  if(fptr.f1==NULL)
    {
      printf("%s couldnt be opened \n",argv[1]);  
      return 0;
    }
  fptr.f2=fopen(argv[2],"r");
  if(fptr.f2==NULL)
    {
      printf("%s couldnt be opened \n",argv[2]);
      return 0;
    }

  fptr.f3=fopen(argv[3],"r");
  if(fptr.f3==NULL)
    {
      printf("%s couldnt be opened \n",argv[3]);
       return 0;
    }
  fptr.f4=fopen("asa.int","w");
  fptr.f5=fopen("temp1.hb","w");
  fptr.f6=fopen("temp2.hb","w");

  int buried=0,total=0;
  if(argc >4)
    interface(fptr,buried,total,argv[4]);
  else
    interface(fptr,buried,total);

  if (argc > 5)
    printf("%d %d ",total,buried);
  
  return 0;
}
 
