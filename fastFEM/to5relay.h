#ifndef TO5RELAY_H
#define TO5RELAY_H

#include "relay.h"



/*!
 \brief 计算TO5的静态磁场

*/
class to5Relay : public Relay
{
public:
    to5Relay();
    ~to5Relay();

    void init();
    void calcMagForce(int index);
    void run();
    void outputResults();

private:

};

#endif // TO5RELAY_H
