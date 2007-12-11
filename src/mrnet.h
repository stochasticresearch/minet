extern "C" {
void mrnet( double* mim, int* size, double* res)
{     
      double* red = new double[(*size)]; 
      double* rel = new double[(*size)];      
      double score = 1;     
      int jmax=0,den;    
      for( int i=0; i<(*size); ++i )
      {
            for( int j=0; j<(*size); ++j ) {
                  rel[j]=mim[i*(*size)+j];
                  red[j]=0;
            }
            for( int k=0; k<(*size)-1; k++ ) { 
                  for( int j=1; j<(*size); ++j ) {   
                         if( k==0 ) den=1;        
                         else den=k;
                         if( (rel[j]-red[j]/den) > rel[jmax]-red[jmax]/den ) 
                              jmax = j;
                  }      
                  score = rel[jmax]-red[jmax]/den;
                  if( res[jmax*(*size)+i] < score )
                        res[jmax*(*size)+i] = res[i*(*size)+jmax] = score;

                  rel[jmax]=NA; 
                  for( int l=0; l<(*size); ++l )  
                        red[l] += mim[l*(*size)+jmax];
                  if( score<0 ) k=(*size);
            }
      }
      for( int i=0; i<(*size); ++i ) res[i*(*size)+i]=0;
      delete [] red;
      delete [] rel;
}
}
