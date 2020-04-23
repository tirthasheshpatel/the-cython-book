cdef struct process: # You can also use ctypedef instead of cdef
    int pid
    short state
    double burst_time
    double runtime
    double wait_time

cpdef process create_process(int pid, short state, double burst_time, double runtime, double wait_time):
    # cdef process p = process(pid=pid, state=state, burst_time=burst_time, runtime=runtime, wait_time=wait_time)
    # cdef process p = {'pid': pid, 'state': state, 'burst_time': burst_time, 'runtime': runtime, 'wait_time': wait_time}
    # The above two methods involve python's overhead. To avoid it, refer to the line below
    cdef process p = process(pid, state, burst_time, runtime, wait_time)
    return p

ctypedef struct node:
    void* info
    int dtype
    node* next
    node* prev

ctypedef struct linked_list:
    int size
    node* head

