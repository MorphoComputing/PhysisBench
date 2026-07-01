# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1VII\seeds\seed_0\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 0.945 A
- tm_score_ca_ordered: 0.8917701151447794
- heavy_atom_rmsd: 2.625 A
- sidechain_heavy_atom_rmsd: 3.362 A
- **all-atom quality (honest):** heavy 2.625 A, sidechain 3.362 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 248
- bin_accuracy: 0.915

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9450188101574774
- ga_delta_rmsd: 0.14584456356507247  ga_fitness_mode: energy
- pre_local_rmsd: 0.9450061671676284  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=4 · 3-10(G)=4 · coil(C)=6

```
CCHHHHHHECCECGHGHHHEHHHHGHGHHHHEHC
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=8 · sheet=1
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - S15 ↔ N19  (helix)
  - A18 ↔ L22  (helix)
  - N19 ↔ W23  (helix)
  - L22 ↔ Q26  (helix)
  - K24 ↔ L28  (helix)
  - Q26 ↔ K30  (helix)
  - M12 ↔ L20  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=108 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=15 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7273 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
