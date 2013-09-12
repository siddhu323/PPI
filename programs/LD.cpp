#include<iostream>
#include<vector>
#include<fstream>
#include<math.h>
#include <sstream>

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

int main(int argc,char *argv[])
{
  vector<atom> interface;
  
  ifstream input;
  string filename(argv[1]),line;
  filename.append(".int");
  input.open(filename.c_str(),ifstream::in);
  
  atom temp;
  int N=0;
  float dist;
  while (getline(input, line))
    {
      string a,b,c,d,e,f,g,h;
      istringstream iss(line);
      iss>>ignoreToken>>ignoreToken>>ignoreToken>>ignoreToken>>ignoreToken>>ignoreToken>>temp.x>>temp.y>>temp.z>>ignoreToken>>ignoreToken>>ignoreToken;
      // iss>>skipws>>a>>b>>c>>d>>e>>h>>temp.x>>temp.y>>temp.z>>f>>g;
      //cout<<temp.x<<"  "<<temp.y<<"  "<<temp.z<<endl;
      interface.push_back(temp);      
    }
  
  for(vector<atom>::iterator it=interface.begin();it!=interface.end();it++)
    {
      for(vector<atom>::iterator jt=interface.begin();jt!=interface.end();jt++)
	{
	  dist= sqrt(pow(((*it).x-(*jt).x),2)+pow(((*it).y-(*jt).y),2)+pow(((*it).z-(*jt).z),2));
	  //cout<<dist<<endl;

	  if(dist<12.00)
	    N++;
	}
      // cout<<(*it).x;
    }
  
  float LD = N/interface.size();
  //  printf("%d %d %f",N,interface.size(),LD);
  printf("%f",LD);
  return 0;
}
