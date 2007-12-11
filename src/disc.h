extern "C" {
void discEF( double* data, int* nrows, int* ncols, int* nbins, int* res )
{
    const double epsilon = 0.01;
    double* spl = new double[(*nbins)];
    double* col = new double[(*nrows)];
    for( int v=0; v<(*ncols); ++v )
    {
        int N=(*nrows);
        for( int s=0; s<N; ++s )
            col[s] = data[v*N+s];
        sort(col,col+N);
        for( int j=N-1; col[j]==NA; --j ) N--;
        int freq = N/(*nbins), mod = N%(*nbins);
        int splitpoint=freq-1;
        for( int i=0; i<(*nbins)-1; ++i ) {
              if( mod>0 ) {spl[i] = col[splitpoint+1]; mod--;}
              else spl[i]=col[splitpoint];
              splitpoint += freq;
         }
         spl[(*nbins)-1] = col[N-1]+epsilon;
         for( int s=0; s<(*nrows); ++s )
            if( data[s+v*(*nrows)]!=NA )
            {
                int bin = -1;
                for( int k=0; bin==-1 && k<(*nbins); ++k )
                   if( data[s+v*(*nrows)] <= spl[k] ) bin=k;
                res[s+v*(*nrows)] = bin;
            }
            else res[s+v*(*nrows)]=NA;
     }
     delete [] spl;
     delete [] col;
}
void discEW( double* data, int* nrows, int* ncols, int* nbins, int* res )
{
      int N=(*nrows), n=(*ncols);
      for( int v=0; v<n; ++v ) {
            double max=double(INT_MIN), min=double(INT_MAX);
            for( int i=0; i<N; ++i )
              if( data[v*N+i] != NA )
                  if( data[v*N+i] > max ) max=data[v*N+i];
                  else if( data[v*N+i] < min ) min=data[v*N+i];
            double binsize = (max-min)/(*nbins);
            for( int s=0; s<N; ++s ) {
                  int b=0;
                  if( data[v*N+s]==NA ) b=NA;
                  else while(! ( (min+b*binsize)<=data[v*N+s] && 
                             data[v*N+s]<(min+(b+1)*binsize) ) ) ++b;
                  if( b==(*nbins) ) 
                        b=(*nbins)-1;              
                  res[v*N+s]=b;
            }
      }
}
}
