#include <stdio.h>

#define MAX 10

int arr[MAX];

void qsort(int order[], int left, int right){

	if(left<right){
	
		int l = left+1;
		int r = right;
		int pivot = arr[order[left]];
		int temp;

		while(l<=r){
			for(;pivot>arr[order[l]] && (l<r);l++);
			for(;pivot<arr[order[r]];r--);

			if(l<r){
				temp = order[l];
				order[l] = order[r];
				order[r] = temp;
			}
			else 	break;

		}
		temp = order[left];
		order[left] = order[r];
		order[r] = temp;

		qsort(order, left, r-1);
		qsort(order, r+1, right);
	}
}


void main(void)
{

	freopen("text.txt","r",stdin);
	setbuf(stdout,NULL);
	
	
	int order[MAX];
	int i;
	int t,k;
	
	scanf("%d",&t);
	for(k=0;k<t;k++){

		for(i=0;i<MAX;i++)
			scanf("%d",&arr[i]);

		for(i=0;i<MAX;i++)
			order[i] =i;

		qsort(order, 0, MAX-1);

		for(i=0;i<MAX;i++)
			printf("%d ",arr[order[i]]);
		printf("\n");
	}
	
}
