class Task{
  String name;
  bool isDone;

  Task(this.name,{this.isDone=false}){}
    dynamic toggleDone(){
      isDone= !isDone;
    }
  }
