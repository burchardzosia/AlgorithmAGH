from queue import PriorityQueue
from math import inf
#we have a graph, and robot can walk on them
#the robot has to go through all the points on the P-list in exactly this order
#return the length of the road
def relax(graph,u,v,distance,parent):
    if distance[v]>distance[u]+graph[u][v]:
        distance[v]=distance[u]+graph[u][v]
        parent[v]=u
        return True
    return False
def dijkstra(graph,source,end):
    queue=PriorityQueue()
    queue.put((0,source))
    visited=[False]*len(graph)
    parent=[None]*len(graph)
    distance=[inf]*len(graph)
    distance[source]=0
    while not queue.empty():
        dist,u=queue.get()
        for v in range(len(graph[u])):
            if graph[u][v]!=0 and not visited[u]:
                if relax(graph,u,v,distance,parent):
                    queue.put((dist+graph[u][v],v))
        visited[u]=True
    return distance


def robot( G, P ):
    graph=[[0 for i in range(len(G))]for j in range(len(G))]
    for i in range(len(G)):
        for j in range(len(G[i])):
            graph[i][G[i][j][0]]=G[i][j][1]
    number=0
    for i in range(len(P)-1):

        distance=dijkstra(graph,P[i],P[i+1])
        number+=distance[P[i+1]]

    return number


G = [
 [(1, 3), (2, 3)],
 [(0, 3), (4, 4)],
 [(0, 3), (3, 1), (4, 4)],
 [(2, 1), (4, 2)],
 [(1, 4), (2, 4), (3, 2)]
]
P = [0, 3, 4]
print(robot(G,P))
