#include <stdio.h>

int p, f, pp[100001], fp[100001], pv[100001], mh = 0x7fffffff;

int min(int a, int b)
{
	return a > b ? b :a;
}

int abs(int a)
{
	return a>0?a:-a;
}

void g(int pt, int ft, int h)
{
	int i;
	if(ft ==f)
	{
		mh = min(mh,h);
		return;
	}

	for(i=1;i<=p;i++)
	{
		if(pv[i] == 0)
		{
			pv[i] = 1;
			h+=abs(pp[i]-fp[ft+1]);
			g(i,ft+1,h);
			h-=abs(pp[i]-fp[ft+1]);
			pv[i] = 0;
		}
	}
}

int main(void)
{

	freopen("text.txt","r",stdin);
	setbuf(stdout,NULL);

	int i;
	scanf("%d %d", &p, &f);
	for(i=1;i<=p;i++)
		scanf("%d",&pp[i]);
	for(i=1;i<=f;i++)
		scanf("%d",&fp[i]);
	g(0,0,0);
	printf("%d\n",mh);
	return 0;

}
