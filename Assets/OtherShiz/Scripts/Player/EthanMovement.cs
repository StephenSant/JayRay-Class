using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EthanMovement : MonoBehaviour
{
    public Animator animator;
    public float walkSpeed = 1, runSpeed = 2;
    public bool isCrouching = false;

    Vector2 movement;

    private void Awake()
    {
        animator = GetComponent<Animator>();
    }

    void Update()
    {
        Vector2 input = new Vector2(Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"));
        
        if (Input.GetKey(KeyCode.LeftShift))
        {
            movement = new Vector2(input.x*2, input.y*2);
        }
        else
        {
        movement = new Vector2(input.x, input.y);
        }
        animator.SetFloat("Horizontal", movement.x); 
        animator.SetFloat("Vertical", movement.y); 
        animator.SetFloat("Speed", movement.y);

        if (Input.GetKey(KeyCode.LeftControl))
        {
            animator.SetBool("Crouch", true);
        }
        else
        {
            animator.SetBool("Crouch", false);
        }
    }
}
