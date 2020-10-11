#include<iostream>
#include<vector>
using namespace std;
//#DEFINE CMTOI 0.393701

class WorkoutTracker{
    bool Gender;
    int Age;
    float Weight;
    float Height;
    float BF;
    vector<int> WeightHist;
    vector<float> BFHist;
public:
    bool getGender(){
        return Gender;
    }
    int getAge(){
        return Age;
    }
    float getBMR(){
        float W=Weight;
        float BMR = (370 + 21.6*(1 - BF)*W);;
        return BMR;
    }
};

class Person{
    bool Gender;
    int Age;
    float Weight;
    float Height;
    float BF;
};

int main(){
    WorkoutTracker A;
    A.getBMR();
    return 0;
}
