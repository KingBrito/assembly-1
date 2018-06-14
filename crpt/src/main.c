#include <stdio.h>
#include <stdlib.h>

int encriptar(unsigned char key, char* name);
int decriptar(unsigned char key, char* name);

int main(){
  unsigned char key;
  char name[100];
  int op;
  printf("Digite a chave:");
  scanf("%c",&key);
  printf("Digite o nome do arquivo:");
  scanf(" %100s",name);
  printf("1 - Criptografar\n2 - Descriptografar\n");
  scanf("%d",&op);
  if(op==1){
    if(encriptar(key,name)){
      printf("Error");
    }
  }else if(op==2){
    if(decriptar(key,name)){
      printf("Error");
    }
  }else{
    printf("Invalid option\n");
  }
  return 0;
}
