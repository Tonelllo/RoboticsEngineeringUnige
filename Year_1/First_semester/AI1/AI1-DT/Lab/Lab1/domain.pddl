(define (domain banana)
    ;; predicates
    (:predicates
        (ROOM ?r)
        (BALL ?b)
        (GRIPPER ?g)
        (at-robby ?r)
        (at-ball ?b ?r)
        (free ?g)
        (carry ?b, ?g)
    )
    ;; first action
    (:action move
        :parameters (?r1 ?r2)
        :precondition (and
            (ROOM ?r2)
            (ROOM ?r2) 
            (at-robby ?r1) 
        )
        :effect (and
            (at-robby ?r2)
            (not (at-robby ?r1))
        )
    )
    ;; last action
    (:action pick-up 
        :parameters (?x ?y ?z)
        :precondition (and
            (BALL ?x)
            (ROOM ?y)
            (GRIPPER ?z)
            (at-ball ?x ?y)
            (at-robby ?y)
            (free ?z)
        )
        :effect (and 
            (carry ?z ?x)
            (not (at-ball ?x ?y))
            (not (free ?z))
            )
        )

    (:action drop 
        :parameters (?x ?y ?z)
        :precondition (and
            (BALL ?x)
            (ROOM ?y)
            (GRIPPER ?z)
            (carry ?z ?x)
            (at-robby ?y)
        )
        :effect (and 
            (at-ball ?x ?y)
            (free ?z)
            (not (carry ?z ?x))
        )
    )
)
