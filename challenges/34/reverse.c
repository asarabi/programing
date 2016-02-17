#include <stdio.h>

unsigned long reverse(unsigned long x)
{
	unsigned long y=0;

	while(x>0){
		y = (y*10) + (x %10);
		x /= 10;
	}
	return y;
}
void main(void)
{

	freopen("text.txt","r",stdin);
	setbuf(stdout,NULL);
	
	int num_cases, iter;
	unsigned long n,r;

	scanf("%d", &num_cases);
	while(num_cases-->0){
		scanf("%lu",&n);
		iter=0;
		while(n != (r = reverse(n))){
			n +=r;
			iter++;
		}
		printf("%d %lu\n",iter,n);
	}

}
