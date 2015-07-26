using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class Stack {
    hidden var top = 0;
    hidden var items;

    function initialize(size){
        items = new[size];
    }

    function push(item){
        items[top] = item;
        top = top + 1;
    }

    function pop(item){
        if(top == 0){
            return null;
        }
        top = top - 1;
        return items[top];
    }
}

class DoublyLinkedNode {
    var prev;
    var next;
    var data;

    function initialize(data_){
        data = data_;
    }
}

class DoublyLinkedList {
    var firstNode;
    var lastNode;
    var count = 0;

    function addFirst(item){
        var node = new DoublyLinkedNode(item);
        if(firstNode == null){
            firstNode = node;
            lastNode = firstNode;
        } else {
            node.next = firstNode;
            firstNode = node;
        }
        count = count + 1;
    }

    function addLast(item){
        var node = new DoublyLinkedNode(item);
        if(lastNode == null){
            firstNode = node;
            lastNode = firstNode;
        } else {
            lastNode.next = node;
            lastNode = lastNode.next;
        }
        count = count + 1;
    }

    function getFirst(){
        if(firstNode == null){
            return null;
        }
        return firstNode.data;
    }

    function getLast(){
        if(lastNode == null){
            return null;
        }
        return lastNode.data;
    }

    function removeFirst(){
        if(firstNode != null){
            firstNode = firstNode.next;
            count = count - 1;
        }
    }

    function removeLast(){
        if(lastNode != null){
            lastNode = lastNode.prev;
            count = count - 1;
        }
    }
}

class Queue extends DoublyLinkedList{
    function initialize(){
    }

    function enqueue(item){
        addLast(item);
    }

    function dequeue(){
        var item = getFirst();
        if(item == null){
            return null;
        }
        removeFirst();
        return item;
    }
}