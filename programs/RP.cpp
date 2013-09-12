#include<iostream>
#include<vector>
#include<fstream>
#include<math.h>
#include <sstream>
#include<map>
using namespace std;

struct residue_key
{
  char chain;
  int resno;
  bool operator <(const residue_key &B) const
  {
    //    return forward_as_tuple(chain,resno) < forward_as_tuple(B.chain,B.resno);
    if(chain < B.chain)
      return true;
    else 
      {
	if(chain != B.chain)
	  return false;
	else
	  {
	    if(resno < B.resno)
	      return true;
	    else
	      return false;
	  }
      }
  }
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

  map<std::string,float> propensity;
  
  propensity["ALA"]=-0.03;
  propensity["ARG"]=-0.02;
  propensity["ASN"]=-0.06;
  propensity["ASP"]=-0.31;
  propensity["CYS"]=0.34;
  propensity["GLN"]=-0.16;
  propensity["GLU"]=-0.35;
  propensity["GLY"]=-0.21;
  propensity["HIS"]=0.21;
  propensity["ILE"]=0.34;
  propensity["LEU"]=0.39;
  propensity["LYS"]=-0.41;
  propensity["MET"]=0.59;
  propensity["PHE"]=0.5;
  propensity["PRO"]=-0.09;
  propensity["SER"]=-0.05;
  propensity["THR"]=-0.05;
  propensity["TRP"]=0.35;
  propensity["TYR"]=0.33;
  propensity["VAL"]=0.22; 
  
  ifstream input;
  string filename(argv[1]),line;
  filename.append(".int");
  input.open(filename.c_str(),ifstream::in);
  
  map<residue_key,string> residues;
  int N=0,resno;
  string amino;
  char chain;
  residue_key temp;
  float RP=0;

  while (getline(input, line))
    {
      istringstream iss(line);
      iss>>ignoreToken>>ignoreToken>>ignoreToken>>amino>>chain>>resno>>ignoreToken>>ignoreToken>>ignoreToken>>ignoreToken>>ignoreToken>>ignoreToken;
      temp.chain=chain;
      temp.resno=resno;
      residues[temp]=amino;
    }
  for(map<residue_key,string>::iterator it=residues.begin();it != residues.end();it++)
    {
      // cout<<(it->first.chain)<<" "<<(it->first.resno)<<endl;
      RP+=propensity[it->second];
    }
  
  printf("%f",RP);
  return 0;
}
