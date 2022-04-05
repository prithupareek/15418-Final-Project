
#ifndef NODE_H
#define NODE_H

#include <stdlib.h>

class AstarNode
{
public:
    size_t vertexDescriptor;
    int gValue;
    int hValue;
    AstarNode *parent;

    AstarNode(size_t vd, int gValue, int hValue, AstarNode *parent);
    ~AstarNode();
};

/**
 * @brief Sorts the nodes by f-value for use in the priority queue
 *
 */
struct OpenListNodeComparator
{
    bool operator()(const AstarNode *n1, const AstarNode *n2) const
    {
        // NOTE Weight is 100t, but can be changed if we decided to do weighted A*
        return n1->gValue + n1->hValue > n2->gValue + n2->hValue;
    }
};

/**
 * @brief used as the comparator for nodes in the set
 *
 */
struct ClosedListNodeComparator
{
    bool operator()(const AstarNode *n1, const AstarNode *n2) const
    {
        return n1->vertexDescriptor == n2->vertexDescriptor;
    }
};

/**
 * @brief Used to store all of the nodes in the closed list set and allow for O(1) lookup
 *
 */
struct NodeHasher
{
    size_t operator()(const AstarNode *n) const
    {
        return n->vertexDescriptor;
    }
};

#endif /* NODE_H */