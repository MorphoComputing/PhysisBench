# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1CTF\seeds\seed_1\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 0.578 A
- tm_score_ca_ordered: 0.9626537775703633
- heavy_atom_rmsd: 2.206 A
- sidechain_heavy_atom_rmsd: 2.837 A
- **all-atom quality (honest):** heavy 2.206 A, sidechain 2.837 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 2016
- bin_accuracy: 0.849

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5779803470484469
- ga_delta_rmsd: -0.013772468107455915  ga_fitness_mode: energy
- pre_local_rmsd: 0.5953327111921491  localized_anchor_rmsd: 0.5779426013008552

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`

## Secondary Structure (DSSP-like)

- helix(H)=40 · strand(E)=14 · 3-10(G)=8 · coil(C)=4

```
CEGGGHEHEHHHHHHHHHHHHGEHEEHGHHHHHHHGEHECGEEHEEHHHHHHHHHHHHHHHECGEC
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=28 · sheet=3
  - K6 ↔ A10  (helix)
  - A8 ↔ K12  (helix)
  - A10 ↔ A14  (helix)
  - N11 ↔ V15  (helix)
  - K12 ↔ I16  (helix)
  - V13 ↔ K17  (helix)
  - A14 ↔ A18  (helix)
  - V15 ↔ V19  (helix)
  - I16 ↔ R20  (helix)
  - K17 ↔ G21  (helix)
  - R20 ↔ G24  (helix)
  - L27 ↔ K31  (helix)
  - E29 ↔ L33  (helix)
  - A30 ↔ V34  (helix)
  - K31 ↔ E35  (helix)
  - V34 ↔ P38  (helix)
  - G44 ↔ D48  (helix)
  - K47 ↔ E51  (helix)
  - D48 ↔ A52  (helix)
  - D49 ↔ L53  (helix)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=257 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=110 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1221 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)
