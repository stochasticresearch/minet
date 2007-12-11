/* TESTED OK */
double abs( double p ) { if(p<0.0) return -p; else return p; }
extern "C" {
void aracne(double* mim, int* nbvar, double* e, double* res)
{
      double eps = *e;      
      int n = *nbvar;
      bool* tag = new bool[n*n];
      for( int i=0; i<n*n; ++i ) tag[i]=true; 
      
      double eps1,eps2,eps3;
      for(int i = 2; i < n ; ++i) 
         for(int j = 1; j < i; ++j) 
            for(int k = 0; k < j ; ++k) {
                  eps1 = mim[j*n+k] - mim[i*n+j];
                  eps2 = mim[i*n+k] - mim[i*n+j];
                  eps3 = mim[i*n+k] - mim[j*n+k];
                  if( abs(eps1)>eps || abs(eps2)>eps || abs(eps3)>eps ) { 
                        if((eps1 > eps) and (eps2 > eps)) // if (ij) minimum tag (ij) for elimination
                             tag[i*n+j]=tag[j*n+i]=false; 
                        else if(eps3 > eps) // if a_ij is not minimal and a_ik neither then tag a_jk
                             tag[j*n+k]=tag[k*n+j]=false;
                        else
                             tag[i*n+k]=tag[k*n+i]=false;
                  }
            }
      for( int i=0; i<n*n; ++i )
            if(tag[i]) res[i]=mim[i];
      for( int i=0; i<n; ++i ) res[i*n+i]=0;
      delete [] tag;
}
}
