#include<iostream>
#include<vector>
#include<fstream>
#include<math.h>
#include <sstream>
#include<map>
using namespace std;

struct atom
{
  float x,y,z;
};
template <class charT, class traits>
inline std::basic_istream<charT, traits> &
ignoreToken (std::basic_istream<charT, traits> &strm)
{
  char c;
  strm>>c;
  strm.ignore (9999, ' ');
  return strm;
}

void calc_HI (vector<atom> &A,vector<atom> &B,float &HI)
{
  for(vector<atom>::iterator it=A.begin();it != A.end();it++)
    {
      int count =0,i=0;
      for(vector<atom>::iterator jt=B.begin();jt != B.end();jt++)
	{
	  float dist= sqrt(pow((it->x-jt->x),2)+pow((it->y-jt->y),2)+pow((it->z-jt->z),2));

	  if(dist<6.05)
	    count++;
	  if(count > 1)
	    break;
	}
      if(count > 1)
	HI+= 0.9;
      else
	HI+=0.5;
    }
}

int main(int argc,char *argv[])
{

  
  ifstream input;
  string filename(argv[1]),line;
  filename.append(".int");
  input.open(filename.c_str(),ifstream::in);
  
  vector<atom> chainA_c;
  vector<atom> chainB_c;
  int N=0,resno;
  string amino;
  char chain,ele;
  atom temp;
  vector<atom>::iterator mid;
  float RP=0;

  while (getline(input, line))
    {
      istringstream iss(line);
      iss>>ignoreToken>>ignoreToken>>ele>>ignoreToken>>ignoreToken>>chain>>ignoreToken>>temp.x>>temp.y>>temp.z>>ignoreToken>>ignoreToken>>ignoreToken;
      if(ele == 'C')
	{
	  if (chain == 'A')
	    chainA_c.push_back(temp);
	  else
	    chainB_c.push_back(temp);
	}
    }
  float HI =0;
  calc_HI(chainA_c,chainB_c,HI);
  calc_HI(chainB_c,chainA_c,HI);
  cout << " " << HI;
  return 0;
}
