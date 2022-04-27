#include "node.h"

AstarNode::AstarNode(size_t vd, int gValue, int hValue, AstarNode *parent)
{
    this->vertexDescriptor = vd;
    this->gValue = gValue;
    this->hValue = hValue;
    this->parent = parent;
}

AstarNode::~AstarNode()
{

}