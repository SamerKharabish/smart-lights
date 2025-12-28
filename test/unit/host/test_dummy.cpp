#include "CppUTest/TestHarness.h"

TEST_GROUP(DummyTests) {
    void setup() override {
        // Setup code if needed
    }

    void teardown() override {
        // Teardown code if needed
    }
};

TEST(DummyTests, FailTest) {
    FAIL("FAIL!");
}