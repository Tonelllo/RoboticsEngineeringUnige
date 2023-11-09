(define (problem avocado)
    (:domain banana)
    ;; pddl code for objects
    (:objects
        roomA
        roomB
        ball1
        ball2
        ball3
        ball4
        left
        right
    )
    ;; pddl code for initial state
    (:init
        (ROOM roomA)
        (ROOM roomB)
        (BALL ball1)
        (BALL ball2)
        (BALL ball3)
        (BALL ball4)
        (GRIPPER left)
        (GRIPPER right)
        (free left)
        (free right)
        (at-robby roomA)
        (at-ball ball1 roomA)
        (at-ball ball2 roomA)
        (at-ball ball3 roomA)
        (at-ball ball4 roomA)
    )
    ;; code for goal specification
    (:goal
        (and
            (at-ball ball1 roomB)
            (at-ball ball2 roomB)
            (at-ball ball3 roomB)
            (at-ball ball4 roomB)
        )
    )
)
