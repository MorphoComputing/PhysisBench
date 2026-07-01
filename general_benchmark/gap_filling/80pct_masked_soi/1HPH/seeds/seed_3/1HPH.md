# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HPH\seeds\seed_3\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 2.513 A
- tm_score_ca_ordered: 0.4200390053110572
- heavy_atom_rmsd: 4.293 A
- sidechain_heavy_atom_rmsd: 5.213 A
- **all-atom quality (honest):** heavy 4.293 A, sidechain 5.213 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 235
- bin_accuracy: 0.770

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.5130553326530833
- ga_delta_rmsd: 0.35545092116331123  ga_fitness_mode: energy
- pre_local_rmsd: 2.5130257950279  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=11 · 3-10(G)=10 · coil(C)=4

```
CEEEGHGGGCEHGGGHHEHHHHEEECHEEGHCGGE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=4 · sheet=11
  - K12 ↔ S16  (helix)
  - S16 ↔ V20  (helix)
  - M17 ↔ E21  (helix)
  - L27 ↔ H31  (helix)
  - E3 ↔ G11  (sheet)
  - I4 ↔ G11  (sheet)
  - G11 ↔ E18  (sheet)
  - E18 ↔ L23  (sheet)
  - E18 ↔ R24  (sheet)
  - E18 ↔ K25  (sheet)
  - L23 ↔ Q28  (sheet)
  - L23 ↔ D29  (sheet)
  - R24 ↔ D29  (sheet)
  - Q28 ↔ A35  (sheet)
  - D29 ↔ A35  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=82 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=3 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9279 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
