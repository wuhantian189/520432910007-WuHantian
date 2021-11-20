//交叉功能
//变异功能
//新基因代替老基因
class DNA{
  PVector[] genes;
  float maxforce=0.1;
  
  //构造函数
  DNA(){
    genes=new PVector[lifetime];
    for(int i=0;i<genes.length;++i){
      genes[i]=new PVector (cos(random(TWO_PI)),sin(random(TWO_PI)));
      genes[i].mult(random(0,maxforce));
    }
  }
  
  //交叉功能
  DNA crossover(DNA partner){
    PVector[] child=new PVector[this.genes.length]; //下一代基因初始化
    int crossover=int(random(genes.length));//从基因中随机提取出一个
    for(int i=0;i<genes.length;++i){
      if(i>crossover)
        child[i]=this.genes[i];
      else
        child[i]=partner.genes[i];
    }
    DNA newgenes=new DNA(child);
    return newgenes;
  }
  
  //变异功能
  void mutate(float m){
    for(int i=0;i<this.genes.length;++i){
      if(random(1)<m){
        this.genes[i]=new PVector (cos(random(TWO_PI)),sin(random(TWO_PI)));
        this.genes[i].mult(random(0,maxforce));
      }
    }
  }
  
  //构造函数的重载函数实现新基因代替老基因
  DNA(PVector[] newgenes){
    this.genes=newgenes;
  }
}
