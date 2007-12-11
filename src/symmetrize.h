extern "C" {
void symmetrize( double* mat, int* n, double* res )
{
      for( int i=0; i<(*n); ++i )
        for( int j=0; j<(*n); ++j )
            if( mat[i*(*n)+j]!=0 || mat[j*(*n)+i]!=0 )
                  res[i*(*n)+j]=res[j*(*n)+i]=1;
}
}
