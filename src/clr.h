/* TESTED OK */

extern "C" {
void clrnet( double* mim, int* nbvar, double* res )
{   
   int n = *nbvar;
   double tmp,zi,zj;
   double *avg = new double[n];
   double *var = new double[n];
   
   //compute mean and variance
   for(int i = 0; i < n; ++i) 
   {
      avg[i]=0;
      for(int j = 0; j < n; ++j)
            avg[i] += mim[i*n+j];   
      avg[i] /= n;
      var[i]=0;
      for(int j = 0; j < n; ++j) 
      {
         tmp = (mim[i*n+j]-avg[i]); 
         var[i] += tmp*tmp;
      }
      var[i] /= n;
   }
   //build network
   for(int i=1; i<n; ++i) 
      for(int j=0; j<i; ++j)
      {
	      tmp = (mim[i*n+j] - avg[i]);
		if( tmp<0 ) zi = 0;
            else zi = tmp*tmp/var[i];
		tmp = (mim[i*n+j] - avg[j]);
		if( tmp<0 ) zj = 0;
            else zj = tmp*tmp/var[j];			
            res[i*n+j] = sqrt(zi*zi+zj*zj);
            res[j*n+i] = sqrt(zi*zi+zj*zj);
	}
   delete [] avg;
   delete [] var;
}
}
