# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1EGF\seeds\seed_7\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 2.434 A
- tm_score_ca_ordered: 0.6320944386935627
- heavy_atom_rmsd: 4.304 A
- sidechain_heavy_atom_rmsd: 5.457 A
- **all-atom quality (honest):** heavy 4.304 A, sidechain 5.457 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 413
- bin_accuracy: 0.671

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.43407979580554
- ga_delta_rmsd: -1.084898396307513  ga_fitness_mode: energy
- pre_local_rmsd: 2.4526682414105956  localized_anchor_rmsd: 2.434023878272249

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.02), conflicts/hub=2.0, max_incompat=2.22Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I34** — severity 2.17, 2 conflict(s); suspect input ~`S37` (group: push_out)
  - push-out (wants farther): S27@23.5Å(now 20.5,conf 1.00), Y28@20.0Å(now 17.3,conf 0.72)
  - S27↔S37: targets 23.5/7.3Å but partners are 14.0Å apart → too_close_together by 2.2Å
  - Y28↔S37: targets 20.0/7.3Å but partners are 10.9Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=22 · 3-10(G)=6 · coil(C)=9

```
EEGCCCEHEHGGEEHCEECEECCHEHEEEECGGHHEHHHHHHEGEEEEHEC
```

## Backbone H-bond Network

- total=45 · helix(i→i+4)=2 · sheet=43
  - I34 ↔ G38  (helix)
  - G38 ↔ Q42  (helix)
  - S1 ↔ M20  (sheet)
  - S1 ↔ H21  (sheet)
  - Y2 ↔ V18  (sheet)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - S7 ↔ C13  (sheet)
  - S7 ↔ M20  (sheet)
  - S7 ↔ H21  (sheet)
  - Y9 ↔ L14  (sheet)
  - Y9 ↔ V18  (sheet)
  - C13 ↔ V18  (sheet)
  - C13 ↔ M20  (sheet)
  - C13 ↔ H21  (sheet)
  - C13 ↔ Y28  (sheet)
  - C13 ↔ T29  (sheet)
  - C13 ↔ C30  (sheet)
  - L14 ↔ T29  (sheet)
  - L14 ↔ C30  (sheet)
  - … +25 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=26 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=195 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=111 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1648 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
