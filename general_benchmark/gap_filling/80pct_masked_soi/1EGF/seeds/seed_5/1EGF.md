# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1EGF\seeds\seed_5\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 2.298 A
- tm_score_ca_ordered: 0.6871137420376549
- heavy_atom_rmsd: 4.166 A
- sidechain_heavy_atom_rmsd: 5.256 A
- **all-atom quality (honest):** heavy 4.166 A, sidechain 5.256 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 413
- bin_accuracy: 0.758

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.298610421987979
- ga_delta_rmsd: 1.4868027374605388  ga_fitness_mode: energy
- pre_local_rmsd: 2.3070290810719345  localized_anchor_rmsd: 2.298496385479894

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.02), conflicts/hub=2.0, max_incompat=2.88Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G11** — severity 3.76, 2 conflict(s); suspect input ~`L51` (group: push_out)
  - push-out (wants farther): V18@10.7Å(now 7.7,conf 0.82), L51@26.5Å(now 23.7,conf 0.77)
  - G17↔L51: targets 10.6/26.5Å but partners are 13.1Å apart → too_close_together by 2.9Å
  - L51↔G16: targets 26.5/10.1Å but partners are 13.5Å apart → too_close_together by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=21 · 3-10(G)=9 · coil(C)=9

```
EEECCECHEEGGGGHEGCCEEGGHEEEEEGEGECCCEEHHHHHHEHHEHEC
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=3 · sheet=43
  - D39 ↔ T43  (helix)
  - Q42 ↔ L46  (helix)
  - T43 ↔ R47  (helix)
  - S1 ↔ M20  (sheet)
  - S1 ↔ H21  (sheet)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - P3 ↔ M20  (sheet)
  - P3 ↔ H21  (sheet)
  - P6 ↔ M20  (sheet)
  - P6 ↔ H21  (sheet)
  - Y9 ↔ M20  (sheet)
  - Y9 ↔ H21  (sheet)
  - Y9 ↔ S27  (sheet)
  - Y9 ↔ Y28  (sheet)
  - Y9 ↔ T29  (sheet)
  - D10 ↔ Y28  (sheet)
  - D10 ↔ T29  (sheet)
  - G16 ↔ N31  (sheet)
  - G16 ↔ V33  (sheet)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=189 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=108 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9525 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
