// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.

namespace Quantum.Kata.Superposition {

    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;


    //////////////////////////////////////////////////////////////////
    // Welcome!
    //////////////////////////////////////////////////////////////////

    // "Superposition" quantum kata is a series of exercises designed
    // to get you familiar with programming in Q#.
    // It covers the following topics:
    //  - basic single-qubit and multi-qubit gates,
    //  - superposition,
    //  - flow control and recursion in Q#.

    // Each task is wrapped in one operation preceded by the description of the task.
    // Each task (except tasks in which you have to write a test) has a unit test associated with it,
    // which initially fails. Your goal is to fill in the blank (marked with // ... comment)
    // with some Q# code to make the failing test pass.

    // The tasks are given in approximate order of increasing difficulty; harder ones are marked with asterisks.

    // Task 1. Plus state
    // Input: a qubit in the |0⟩ state.
    // Goal: prepare a |+⟩ state on this qubit (|+⟩ = (|0⟩ + |1⟩) / sqrt(2)).
    operation PlusState (q : Qubit) : Unit {
        // Hadamard gate H will convert |0⟩ state to |+⟩ state.
        // Type the following: H(q);
        // Then rebuild the project and rerun the tests - T01_PlusState_Test should now pass!

        // ...
        H(q);
    }


    // Task 2. Minus state
    // Input: a qubit in the |0⟩ state.
    // Goal: prepare a |-⟩ state on this qubit (|-⟩ = (|0⟩ - |1⟩) / sqrt(2)).
    operation MinusState (q : Qubit) : Unit {
        // In this task, as well as in all subsequent ones, you have to come up with the solution yourself.

        // ...
        H(q);
        Z(q);
    }


    // Task 3*. Unequal superposition
    // Inputs:
    //      1) a qubit in the |0⟩ state.
    //      2) angle alpha, in radians, represented as Double.
    // Goal: prepare a cos(alpha) * |0⟩ + sin(alpha) * |1⟩ state on this qubit.
    operation UnequalSuperposition (q : Qubit, alpha : Double) : Unit {
        // Hint: Experiment with rotation gates from the Microsoft.Quantum.Intrinsic namespace.
        // Note that all rotation operators rotate the state by _half_ of its angle argument.

        // ...
        Ry(2.0*alpha, q);
    }


    // Task 4. Superposition of all basis vectors on two qubits
    // Input: two qubits in |00⟩ state (stored in an array of length 2).
    // Goal:  create the following state on these qubits: (|00⟩ + |01⟩ + |10⟩ + |11⟩) / 2.
    operation AllBasisVectors_TwoQubits (qs : Qubit[]) : Unit {
        // The following lines enforce the constraints on the input that you are given.
        // You don't need to modify them. Feel free to remove them, this won't cause your code to fail.
        EqualityFactI(Length(qs), 2, "The array should have exactly 2 qubits.");

        // ...
        H(qs[0]);
        H(qs[1]);
    }


    // Task 5. Superposition of basis vectors with phases
    // Input: two qubits in |00⟩ state (stored in an array of length 2).
    // Goal:  create the following state on these qubits: (|00⟩ + i*|01⟩ - |10⟩ - i*|11⟩) / 2.
    operation AllBasisVectorsWithPhases_TwoQubits (qs : Qubit[]) : Unit {
        // The following lines enforce the constraints on the input that you are given.
        // You don't need to modify them. Feel free to remove them, this won't cause your code to fail.
        EqualityFactI(Length(qs), 2, "The array should have exactly 2 qubits.");

        // Hint: Is this state separable?
        // ...
        H(qs[0]);
        Z(qs[0]);
        Rx(-0.5 * PI(), qs[1]);
    }


    // Task 6. Bell state
    // Input: two qubits in |00⟩ state (stored in an array of length 2).
    // Goal: create a Bell state |Φ⁺⟩ = (|00⟩ + |11⟩) / sqrt(2) on these qubits.
    operation BellState (qs : Qubit[]) : Unit {
        // ...
        H(qs[0]);
        CNOT(qs[0], qs[1]);
    }


    // Task 7. All Bell states
    // Inputs:
    //      1) two qubits in |00⟩ state (stored in an array of length 2)
    //      2) an integer index
    // Goal: create one of the Bell states based on the value of index:
    //       0: |Φ⁺⟩ = (|00⟩ + |11⟩) / sqrt(2)
    //       1: |Φ⁻⟩ = (|00⟩ - |11⟩) / sqrt(2)
    //       2: |Ψ⁺⟩ = (|01⟩ + |10⟩) / sqrt(2)
    //       3: |Ψ⁻⟩ = (|01⟩ - |10⟩) / sqrt(2)
    operation AllBellStates (qs : Qubit[], index : Int) : Unit {
        // ...
        H(qs[0]);
        CNOT(qs[0], qs[1]);
        if(index%2 == 1)
        {
            Z(qs[0]);
        }

        if( index/2 == 1)
        {
            X(qs[0]);
        }
    }


    // Task 8. Greenberger–Horne–Zeilinger state
    // Input: N qubits in |0...0⟩ state.
    // Goal: create a GHZ state (|0...0⟩ + |1...1⟩) / sqrt(2) on these qubits.
    operation GHZ_State (qs : Qubit[]) : Unit {
        // Hint: N can be found as Length(qs).

        // ...
        H(qs[0]);
        for(i in 1..Length(qs)-1)
        {
            CNOT(qs[0], qs[i]);
        }
    }


    // Task 9. Superposition of all basis vectors
    // Input: N qubits in |0...0⟩ state.
    // Goal: create an equal superposition of all basis vectors from |0...0⟩ to |1...1⟩
    // (i.e. state (|0...0⟩ + ... + |1...1⟩) / sqrt(2^N) ).
    operation AllBasisVectorsSuperposition (qs : Qubit[]) : Unit {
        // ...
        for(i in 0..Length(qs)-1)
        {
            H(qs[i]);
        }
    }


    // Task 10. |00⟩ + |01⟩ + |10⟩ state
    // Input: 2 qubits in |00⟩ state.
    // Goal: create the state (|00⟩ + |01⟩ + |10⟩) / sqrt(3) on these qubits.
    operation ThreeStates_TwoQubits (qs : Qubit[]) : Unit {
        // ...
        Ry(2.0*ArcSin(Sqrt(1.0/3.0)), qs[0]);
        (ControlledOnInt(0, H))([qs[0]], qs[1]);
    }

    // Task 11*. Hardy State
    // Input: 2 qubits in |00⟩ state
    // Goal: create the state (3|00⟩ + |01⟩ + |10⟩ + |11⟩) / sqrt(12) on these qubits.
    operation Hardy_State (qs : Qubit[]) : Unit {
        // ...
        Ry(2.0 *ArcSin(1.0/Sqrt(6.0)), qs[0]);
        (ControlledOnInt(0, Ry))([qs[0]], (2.0 * ArcSin(1.0/Sqrt(10.0)), qs[1]));
        Controlled H([qs[0]], qs[1]);
    }

    // Task 12. Superposition of |0...0⟩ and given bit string
    // Inputs:
    //      1) N qubits in |0...0⟩ state
    //      2) bit string represented as Bool[]
    // Goal: create an equal superposition of |0...0⟩ and basis state given by the bit string.
    // Bit values false and true correspond to |0⟩ and |1⟩ states.
    // You are guaranteed that the qubit array and the bit string have the same length.
    // You are guaranteed that the first bit of the bit string is true.
    // Example: for bit string = [true, false] the qubit state required is (|00⟩ + |10⟩) / sqrt(2).
    operation ZeroAndBitstringSuperposition (qs : Qubit[], bits : Bool[]) : Unit {
        // The following lines enforce the constraints on the input that you are given.
        // You don't need to modify them. Feel free to remove them, this won't cause your code to fail.
        EqualityFactI(Length(bits), Length(qs), "Arrays should have the same length");
        EqualityFactB(bits[0], true, "First bit of the input bit string should be set to true");
        // ...
        H(qs[0]);
        for (i in 1..(Length(qs)-1))
        {
            if(bits[i])
            {
                Controlled X([qs[0]], qs[i]);
            }          
        }
    }


    // Task 13. Superposition of two bit strings
    // Inputs:
    //      1) N qubits in |0...0⟩ state
    //      2) two bit string represented as Bool[]s
    // Goal: create an equal superposition of two basis states given by the bit strings.
    //
    // Bit values false and true correspond to |0⟩ and |1⟩ states.
    // Example: for bit strings [false, true, false] and [false, false, true]
    // the qubit state required is (|010⟩ + |001⟩) / sqrt(2).
    // You are guaranteed that the both bit strings have the same length as the qubit array,
    // and that the bit strings will differ in at least one bit.
    operation TwoBitstringSuperposition (qs : Qubit[], bits1 : Bool[], bits2 : Bool[]) : Unit {
        // ... 
        // First find the index where bits arrays first differ

        mutable firstDifference = -1;
        for(i in 0..(Length(bits1)-1))
        {
            if (bits1[i] != bits2[i] and firstDifference == -1)
            {
                set firstDifference = i;
            }
        }

        H(qs[firstDifference]);
        
        for(i in 0..(Length(qs)-1))
        {
            if(bits1[i] == bits2[i])
            {
                if(bits1[i])
                {
                    X(qs[i]);
                }              
            }
            elif(i != firstDifference)
            {
                Controlled X([qs[firstDifference]], qs[i]);
                if(bits1[i] != bits1[firstDifference])
                {
                    X(qs[i]);
                }
            }
        }
    }


    // Task 14*. Superposition of four bit strings
    // Inputs:
    //      1) N qubits in |0...0⟩ state
    //      2) four bit string represented as Bool[][] bits
    //         bits is an array of size 4 x N which describes the bit strings as follows:
    //         bits[i] describes the i-th bit string and has N elements.
    //         All four bit strings will be distinct.
    //
    // Goal: create an equal superposition of the four basis states given by the bit strings.
    //
    // Example: for N = 3 and bits = [[false, true, false], [true, false, false], [false, false, true], [true, true, false]]
    //          the state you need to prepare is (|010⟩ + |100⟩ + |001⟩ + |110⟩) / 2.
    operation FourBitstringSuperposition (qs : Qubit[], bits : Bool[][]) : Unit {
        // Hint: remember that you can allocate extra qubits.
        let N = Length(qs)-1;
        using(anc = Qubit[2])
        {
            H(anc[0]);
            H(anc[1]);

            for(i in 0..3)
            {
                for(j in 0..N)
                {
                    if(bits[i][j])
                    {
                        (ControlledOnInt(i, X))(anc, qs[j]);
                    }
                }
            }

            // uncompute ancilla
            for(i in 0..3)
            {
                if(i%2 == 1)
                {
                    // Reset first qubit for |01> and |11> 
                    (ControlledOnBitString(bits[i], X))(qs, anc[0]);
                }
                if(i/2 == 1)
                {
                    // Reset second qubit for |01> and |11> 
                    (ControlledOnBitString(bits[i], X))(qs, anc[1]);
                }
            }
        }

        // ...
    }


    // Task 15**. W state on 2ᵏ qubits
    // Input: N = 2ᵏ qubits in |0...0⟩ state.
    // Goal: create a W state (https://en.wikipedia.org/wiki/W_state) on these qubits.
    // W state is an equal superposition of all basis states on N qubits of Hamming weight 1.
    // Example: for N = 4, W state is (|1000⟩ + |0100⟩ + |0010⟩ + |0001⟩) / 2.
    operation WState_PowerOfTwo (qs : Qubit[]) : Unit {
        // Hint: you can use Controlled modifier to perform arbitrary controlled gates.

        let N = Length(qs);
        if (N == 1)
        {
            X(qs[0]);
        }
        else
        {
            let K = Floor(Lg(IntAsDouble(N)));
            using(anc = Qubit[K])
            {
                for(i in 0..(K-1))
                {
                    H(anc[i]);
                }

                for(i in 0..(N-1))
                {
                    (ControlledOnInt(i, X))(anc, qs[i]);
                }

                // unallocate ancilla
                for(i in 1..(N-1))
                {
                    if(i%2 == 1)
                    {
                        (ControlledOnInt(2^i, X))(qs, anc[0]);
                    }
                    
                    for(j in 2..K)
                    {
                        let exp = 2^j;
                        if(i%exp >= exp/2)
                        {
                            (ControlledOnInt(2^i, X))(qs, anc[j-1]);
                        }
                    }
                }
            }            
        }
    }


    // Task 16**. W state on arbitrary number of qubits
    // Input: N qubits in |0...0⟩ state (N is not necessarily a power of 2).
    // Goal: create a W state (https://en.wikipedia.org/wiki/W_state) on these qubits.
    // W state is an equal superposition of all basis states on N qubits of Hamming weight 1.
    // Example: for N = 3, W state is (|100⟩ + |010⟩ + |001⟩) / sqrt(3).
    operation WState_Arbitrary (qs : Qubit[]) : Unit {
        // ...
        let N = Length(qs);
        if (N == 1)
        {
            X(qs[0]);
        }
        else
        {
            Ry(2.0*ArcSin(Sqrt(1.0/IntAsDouble(N))), qs[0]);
            for (i in 1..N-2)
            {
                (ControlledOnInt(0, Ry))(Subarray(RangeAsIntArray(0..i-1), qs), (2.0 * ArcSin(Sqrt(1.0/IntAsDouble(N-i))), qs[i]));
            }
            (ControlledOnInt(0, X))(Subarray(RangeAsIntArray(0..N-2), qs), qs[N-1]);
        }
    }
}
