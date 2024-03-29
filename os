#include<stdio.h>
#include<stdlib.h>
#include<String.h>

//take time in the world clock format eg.  14:24 or 22:45 and 09:15 and calculated times are in minutes.


struct process
{
	int bt,at,rbt;
	char  name[10];
};

struct process *ptr1,*ptr2;
int a=0,b=0,i=0,n,quantum;


void inputdata(void )
{
	char t[10];
	int choice;
	
	for(;i<n;)
	{
		printf("\n\t Job(1/2) :");
		scanf("%d",&choice);
		if(choice==1)
		{
			printf("\n\t Enter Query name :\t");
			scanf("%s",(ptr1+a)->name);
			
			printf("\n\tEnter Arrival time :\t");
			scanf("%s",&t);
			if(t[0]=='0')
			{
				printf("\n\t Enter correct time.....");
				inputdata();
			}
			else{
				(ptr1+a)->at=((t[0]-'0')-1)*60 + (t[1]-'0')*60 +(t[3]-'0')*10 +(t[4]-'0');
			}
			printf("\n\tEnter resolving time  :\t");
			scanf("%d",&(ptr1+a)->bt);
			(ptr1+a)->rbt=(ptr1+a)->bt;
			a++;
		}
		else
		{
		    printf("\n\t Enter Query name :\t");
			scanf("%s",(ptr2+b)->name);
			
			printf("\n\tEnter Arrival time :\t");
			scanf("%s",&t);
			if(t[0]=='0')
			{
				printf("\n\t Enter correct time.....");
				inputdata();
			}
			else{
				(ptr2+b)->at=((t[0]-'0')-1)*60 + (t[1]-'0')*60 +(t[3]-'0')*10 +(t[4]-'0');
			}
			printf("\n\tEnter resolving time  :\t");
			scanf("%d",&(ptr2+b)->bt);
			(ptr2+b)->rbt=(ptr2+b)->bt;
			b++;	
		}
		i++;
	}
}

void FACULTY(void )
{
	int count,remain,flag=0,wt=0,trt=0,time;
	remain=a;
	
	printf("\n\n Query \t | Queries handling time | Waiting time\n\n");
	for(time=0,count=0;remain!=0;)
	{
		if(((ptr1+count)->rbt <= quantum)&&((ptr1+count)->rbt >0))
		{
			time=time+ (ptr1+count)->rbt;
			(ptr1+count)->rbt=0;
			flag=1;
		}
		else if((ptr1+count)->rbt >0)
		{
			(ptr1+count)->rbt -=quantum;
			time=time+quantum;
		}
		if((ptr1+count)->rbt ==0 && flag==1)
		{
			remain--;
			printf("%s\t |\t %d\t |\t %d \n",(ptr1+count)->name,time-((ptr1+count)->at),time-((ptr1+count)->at)-((ptr1+count)->bt));
			wt=wt+time-((ptr1+count)->at)-((ptr1+count)->bt);
			trt=trt +time-((ptr1+count)->at);
			flag=0;
		}
		if(count==a-1)
		    count=0;
		else if((ptr1+count+1)->at <=time)
		    count++;
		else
		    count=0;
	}
	printf("\n\n\tAverage waiting time = %f\n",wt*1.0/a);
	printf("\tAverage queries time = %f\n",trt*1.0/a);
}


void STUDENT(void )
{
	int count,remain,flag=0,wt=0,trt=0,time;
	remain=b;
	
	printf("\n\n Query \t | Queries handling time | Waiting time\n\n");
	for(time=0,count=0;remain!=0;)
	{
		if(((ptr2+count)->rbt <= quantum)&&((ptr2+count)->rbt >0))
		{
			time=time+ (ptr2+count)->rbt;
			(ptr2+count)->rbt=0;
			flag=1;
		}
		else if((ptr2+count)->rbt >0)
		{
			(ptr2+count)->rbt -=quantum;
			time=time+quantum;
		}
		if((ptr2+count)->rbt ==0 && flag==1)
		{
			remain--;
			printf("%s\t |\t %d\t |\t %d \n",(ptr1+count)->name,time-((ptr1+count)->at),time-((ptr1+count)->at)-((ptr1+count)->bt));
			wt=wt+time-((ptr2+count)->at)-((ptr2+count)->bt);
			trt=trt +time-((ptr2+count)->at);
			flag=0;
		}
		if(count==b-1)
		    count=0;
		else if((ptr2+count+1)->at <=time)
		    count++;
		else
		    count=0;
	}
	printf("\n\n\tAverage waiting time = %f\n",wt*1.0/a);
	printf("\tAverage queries time = %f\n",trt*1.0/a);
}



int main()
{
	int m;
	printf("\n\tEnter total number of queries :\t");
	scanf("%d",&n);
	
	ptr1=(struct process *)malloc(n*sizeof(struct process));
		ptr2=(struct process *)malloc(n*sizeof(struct process));
		
		printf("\n\tEnter quantum time for each queries :\t");
		scanf("%d",&quantum);
		
		printf("\n\tEnter 1 for faculty and  2 for student :\n");
		inputdata();
		while(1)
		{
		
		printf("\n\n\t press 1 for FACULTY....");
		printf("\n\t press 2 for STUDENT....");
		printf("\n\t press 3 for EXIT....");
		printf("\t\t..............>");
		scanf("%d",&m);
		switch(m)
		{
			case 1:
				FACULTY();
				break;
			case 2:
				STUDENT();
				break;
			case 3:
				exit(0);
				break;
			default:
				printf("\n\t Enter  right option.....");
				break;
		}
	}
		
}
