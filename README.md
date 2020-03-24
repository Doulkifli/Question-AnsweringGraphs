# this project is about applying Neo4j graph algorithms (or the GDS library) to gain insights from question / answering systems such as StackExchange (SE). Examples of insights include (but are not limited to ) ranking users (using PageRank algorithm), personalised ranking of users, (using PPR) and community detection.
The project is at its beginning: we have already imported data from SE Network about users and their interactions as CSV files. We have already modelled a first type of user interaction as (user) -[:comments] -> (user) in Neo4j graph and we are currently working on modelling other user interactions (votes, answers)...

Our project can be applied to any SE sub-network such as StackOverflow, AskUbuntu, etc. since all the sub-networks share the same database schema.

We hope the discovered knowledge will help enhance user interactions in Q/A systems, for instance by recommending posts according to user profiles, unveiling existing communities, etc.
