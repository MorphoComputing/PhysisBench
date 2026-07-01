# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HPH\seeds\seed_4\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 5.898 A
- tm_score_ca_ordered: 0.19620602646963137
- heavy_atom_rmsd: 7.061 A
- sidechain_heavy_atom_rmsd: 7.831 A
- **all-atom quality (honest):** heavy 7.061 A, sidechain 7.831 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 235
- bin_accuracy: 0.655

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.898234173141146
- ga_delta_rmsd: -0.284589255908565  ga_fitness_mode: energy
- pre_local_rmsd: 5.898284237353088  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.029), conflicts/hub=1.0, max_incompat=2.81Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D29** — severity 1.39, 1 conflict(s); suspect input ~`A35` (group: pull_in)
  - pull-in (wants closer): A35@9.8Å(now 12.6,conf 0.49)
  - R24↔A35: targets 7.0/9.8Å but partners are 19.6Å apart → too_far_apart by 2.8Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=12 · 3-10(G)=3 · coil(C)=1

```
CEHHEHEHHEHEHHEHGEGHHHEHHGHEHHHEHEE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=6 · sheet=11
  - I4 ↔ H8  (helix)
  - N9 ↔ H13  (helix)
  - S16 ↔ V20  (helix)
  - V20 ↔ R24  (helix)
  - E21 ↔ K25  (helix)
  - L27 ↔ H31  (helix)
  - S2 ↔ M7  (sheet)
  - S2 ↔ L10  (sheet)
  - Q5 ↔ L10  (sheet)
  - Q5 ↔ K12  (sheet)
  - M7 ↔ K12  (sheet)
  - L10 ↔ N15  (sheet)
  - L10 ↔ E18  (sheet)
  - K12 ↔ E18  (sheet)
  - E18 ↔ L23  (sheet)
  - L23 ↔ Q28  (sheet)
  - Q28 ↔ V34  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=88 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=2 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0636 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
