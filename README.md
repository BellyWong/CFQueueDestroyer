CFQueueDestroyer
================

CFQueueDestroyer is a simple class used to defer deletion of objects until a later date. Colloquially you can consider it be a "bucket" to discard no longer required objects into.

This could be worked into an object pooling or batch procedure invoker with relatively minimal work.

CFPhysicsQueueDestroyer
================
A clean but usable example is shown with CFPhysicsQueueDestroyer, using a protocol to ensure incoming classes have a Box2D b2Body* member. It provides a simple interface to queue the intended b2Body* objects up and thus avoids the issue of a "mid-physics-tick" deletion of a b2Body* which can lead to bad pointers elsewhere in your simulation.

In this case, you would call "emptyQueue" immediately after your physics tick is completed.
