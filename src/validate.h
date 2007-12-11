
extern "C" {
void validate( double* inet, double* tnet, double* min, double* max, int* n, int* narcs, int* res )
{            
      double* sorted = new double[(*n)*(*n)];
      int size=(*n)*(*n);
      int nbligne = size/(*narcs);
      for( int i=0; i<size; ++i ) sorted[i]=inet[i];
      sort( sorted, sorted+size );
      double t2,t1=-1;
      enum x {TP,FP,TN,FN};
      int s=0;
      for( int l=0; l<size; l+=(*narcs) ){
            t2 = sorted[l];
            if(t2!=t1){            
               res[TP*nbligne+s]=res[FP*nbligne+s]=res[TN*nbligne+s]=res[FN*nbligne+s]=0;
               for( int i=0; i<(*n); ++i )
               for( int j=0; j<(*n); ++j )
                  if( (inet[i*(*n)+j] >= t2) == tnet[i*(*n)+j] )
                        ( inet[i*(*n)+j] >= t2 )? ++res[TP*nbligne+s] : ++res[TN*nbligne+s];
                  else  ( inet[i*(*n)+j] >= t2 )? ++res[FP*nbligne+s] : ++res[FN*nbligne+s];
               t1=t2; 
            }  
            else { 
                  res[TP*nbligne+s]=res[TP*nbligne+s-1];
                  res[FP*nbligne+s]=res[FP*nbligne+s-1];
                  res[TN*nbligne+s]=res[TN*nbligne+s-1];
                  res[FN*nbligne+s]=res[FN*nbligne+s-1];
            }                  
            s++;                      
      }
}
}
